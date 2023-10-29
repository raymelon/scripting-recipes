import random

def choose_word():
    # List of words for the game
    words = ["python", "java", "programming", "computer", "algorithm", "developer", "coding"]
    return random.choice(words)

def play_game():
    word = choose_word()
    guessed_letters = []
    attempts = 6

    print("Welcome to Guess the Word!")
    print("You have 6 attempts to guess the word correctly.")
    
    while attempts > 0:
        display_word = ""
        for letter in word:
            if letter in guessed_letters:
                display_word += letter
            else:
                display_word += "_"
        
        print(f"Word: {display_word}")
        print(f"Attempts left: {attempts}")
        
        if display_word == word:
            print("Congratulations! You've guessed the word:", word)
            break
        
        guess = input("Guess a letter: ").lower()
        
        if len(guess) == 1 and guess.isalpha():
            if guess in guessed_letters:
                print("You already guessed that letter.")
            elif guess in word:
                guessed_letters.append(guess)
                print("Good guess!")
            else:
                guessed_letters.append(guess)
                attempts -= 1
                print("Incorrect guess. Try again.")
        else:
            print("Please enter a valid letter.")
    
    if attempts == 0:
        print("Sorry, you're out of attempts. The word was:", word)

if __name__ == "__main__":
    play_game()

