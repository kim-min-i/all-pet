package pet.main.resources;

import java.util.ArrayList;
import java.util.Random;

public class CreatePenName {
	
	public String getRandTestString(){
		 
	     String RandomNames[] = { "첫번째","두번째","세번째" };
	 
	 
	    Random oRandom = new Random();
	    int randNum = oRandom.nextInt(RandomNames.length);     
	 
	    //Boolean rand_true_false = oRandom.nextBoolean(); //( 랜덤으로 참 거짓을 뽑아냄 )
	     
	 
	 
	    return RandomNames[randNum];
	}
	
	public static void ArraylistRandTest() {
	     
	    ArrayList<String> randomList = new ArrayList<String>();
	    randomList.add("첫번째");
	    randomList.add("두번째");
	    randomList.add("세번째");
	    randomList.add("네번째");
	    randomList.add("다섯번째");
	     
	     
	    ArrayList<String> randomComplete = new ArrayList<String>();     
	     
	    while ( randomList.size() != 0 ) {
	        System.out.println(randomList.size()); //루프내에서 변화함
	        int random = (int)(Math.random()*randomList.size());
	        randomComplete.add( randomList.get(random) );
	        randomList.remove(random); //remove 로 인해서 카운터가 변화
	    }
	     
	     
	    for ( String s: randomComplete ) {
	        System.out.println(s);
	    }
	     
	}


}
