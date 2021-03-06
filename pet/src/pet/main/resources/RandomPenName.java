package pet.main.resources;
import java.util.Arrays; 
import java.util.Collections; 
import java.util.List;
import java.util.Random;

public class RandomPenName {
	public static String pen_name() { 
	List<String> pen1 = Arrays.asList(
			"따듯한", "차가운", "시크한", "귀여운", "정의많은", "강한", "빠른", "삐진", "장난이심한", "임자있는", 
			"한의많은", "오지랖넓은", "신라면 먹는", "성공한", "정의로운", "편식하는", "속상한", "야근하는", "유명한", "붉은", 
			"가슴아픈", "공부쟁이", "코딩하는", "솔직한", "얼음같은", "배아픈", "심심한", "허무한", "노력하는", "근면한"); // 30
	List<String> pen2 = Arrays.asList(
			"고양이", "강아지", "말", "로빈", "참새", "리트리버", "기러기", "뱀", "햄스터", "토끼", 
			"기린", "코뿔소", "노루", "고라니", "부엉이", "두더지", "담비", "족제비", "아르마딜로", "구렁이", 
			"돼지", "호랑이", "용", "황소", "찍찍이", "사자", "오소리", "두꺼비", "라마", "달팽이"); //30
	List<String> pen3 = Arrays.asList(
			"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", 
			"10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
			"21", "22", "23", "24", "25", "26", "27", "28", "29", "30", 
			"31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
			"41", "42", "43", "44", "45", "46", "47", "48", "49", "50",
			"51", "52", "53", "54", "55", "56", "57", "58", "59", "50", 
			"60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70",
			"81", "82", "83", "84", "85", "86", "87", "88", "89", "90" // 82
			); 
	Collections.shuffle(pen1); 
	Collections.shuffle(pen2);
	Collections.shuffle(pen3); 
	
	
	Random pen_name = new Random();
	
	
	
	return pen1.get(0) + pen2.get(0) + pen3.get(1); 
	} 
	
	
	public static void main(String[] args) { // 이름
		for (int i = 0; i < 50000; i++) { 
			if(i % 10 == 0) { 
			System.err.println(); 
			} 
			System.err.print(pen_name()+" "); 
			} 
		}
	}


