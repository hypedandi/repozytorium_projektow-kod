from glob import glob 

# pozytywne recenzje
words_count_pos = {}  
pos_files = glob(dataaclImdbtrainpos.txt)

for file in pos_files
    with open(file) as stream  
        content = stream.read()  

    words = content.lower().replace(br ,  ).split()  

    for word in set(words)
        words_count_pos[word] = words_count_pos.get(word, 0) + 1

# negatywne recenzje
words_count_neg = {}  
neg_files = glob(dataaclImdbtrainneg.txt)

for file in neg_files
    with open(file) as stream
        content = stream.read()

    words = content.lower().replace(br ,  ).split()

    for word in set(words)
        words_count_neg[word] = words_count_neg.get(word, 0) + 1


# wprowadzenie recenzji

sentence = input('Podaj komentarz ')
words = sentence.lower().replace(br ,  ).split()

# Model 
sentence_sentiment = 0.0
for word in words
    pos = words_count_pos.get(word, 0)
    neg = words_count_neg.get(word, 0)

    # sentyment słowa w zakresie -1.0 do +1.0 (0.0 = neutralne)

    # 50 poz, 50 neg = sentyment = 0.0
    # 100 poz, 0 neg = sentyment = +1.0
    # 10 poz,  0 neg = sentyment = +1.0
    # 75 poz, 25 neg = sentyment = +0.5
    # 0 poz, 100 neg = sentyment = -1.0

    all = pos + neg
    if all == 0
        sentiment = 0.0
    else
        sentiment = (pos - neg)  all

    sentence_sentiment += sentiment
    print(word, sentiment)

sentence_sentiment = len(words)

print('Sentiment =', sentence_sentiment)
