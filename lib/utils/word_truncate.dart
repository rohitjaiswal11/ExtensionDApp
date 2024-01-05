class TextFormat{



  static String truncateWord(String word) {
  if (word.length <= 8) {
    // If the word has 8 or fewer characters, return the original word
    return word;
  } else {
    // If the word has more than 8 characters, truncate the starting 4 and ending 4 characters
    return word.substring(0, 4) + '...' + word.substring(word.length - 5);
  }
}










}