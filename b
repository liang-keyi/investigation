#below coding is for quick testing
def run_generation(prob, N):
    
    def hamming_distance(str1, str2):
        if not len(str1) == len(str2): 
            print("error") 
            return -1
        else: 
            distance = 0 
            for i in range(len(str1)): 
                if not str1[i] == str2[i]: 
                    distance = distance + 1
        return distance

    import string
    raw_master_sequence = "If thou survive my well-contented day,\nWhen that churl Death my bones with dust shall cover;"
    translator = ''.maketrans('', '', string.punctuation + string.whitespace)
    master_sequence = raw_master_sequence.translate(translator).lower()
    print(master_sequence)
    
    import random
    def one_random_sequence(length): 
        alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k','l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
        empty_sentence = ''
        for i in range(length): 
            empty_sentence = empty_sentence + random.choice(alphabet)
        return empty_sentence

    length = len(master_sequence)
    random_sequences = []
    for i in range(N): 
        one_sequence = one_random_sequence(length) 
        random_sequences.append(one_sequence)

    str1 = master_sequence
    distances = []
    for i in random_sequences:
        str2 = i 
        d = hamming_distance(str1, str2) 
        distances.append(d)
    min_distance = min(distances)
    min_sequence_index = distances.index(min_distance)
    min_sequence = random_sequences[min_sequence_index]
    print(min_distance)
    print(min_sequence)


    def mutate_function(string_one, prob, N): 
        alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k','l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
        offspring = []
        for _ in range(N): 
            empty_sonnet = '' 
            for character in string_one: 
                if random.random() > 0.1: 
                    empty_sonnet = empty_sonnet + character
                else:
                    empty_sonnet = empty_sonnet + random.choice(alphabet)
            offspring.append(empty_sonnet)
        return offspring
    
    generation = 0
    while True: 
        generation += 1 
        offspring_list = mutate_function(min_sequence, prob, N)
    
        best_sequence = None
        best_distance = None

        for i in offspring_list: 
            new_distance = hamming_distance(str1, i) 
            if best_distance is None or new_distance < best_distance: 
                best_distance = new_distance 
                best_sequence = i

        if best_distance < min_distance:
            min_distance = best_distance
            min_sequence = best_sequence
            print("The", generation + 1, "Evolution successful, distance =", min_distance)
        else:
            print("The", generation + 1, "Evolution unsuccessful, distance =", min_distance)
        
        if min_distance == 0:
            print("The", generation + 1, "evolved, distance =", min_distance)
            break
    return generarion

result = []
for i in range(10):
    times_evolution = run_generation(prob, N)
    result.append(times_evolution)
print(result)

