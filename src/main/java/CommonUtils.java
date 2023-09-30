
public class CommonUtils {
	  public static String capitalizeWordsInPhrase(String phrase) {
	        if (phrase == null || phrase.isEmpty()) {
	            return phrase; // Return the input if it's null or empty.
	        }

	        // Split the phrase into words using spaces as delimiters.
	        String[] words = phrase.split(" ");

	        // Create a StringBuilder to build the capitalized phrase.
	        StringBuilder capitalizedPhrase = new StringBuilder();

	        for (String word : words) {
	            // Check if the word is not empty.
	            if (!word.isEmpty()) {
	                // Capitalize the first letter of the word and append it to the result.
	                char firstChar = Character.toUpperCase(word.charAt(0));
	                String restOfWord = word.substring(1);
	                capitalizedPhrase.append(firstChar).append(restOfWord).append(" ");
	            }
	        }

	        // Remove the trailing space and return the result.
	        return capitalizedPhrase.toString().trim();
	    }

}
