package pet.main.resources;

import java.util.Arrays;
import java.util.Random;

public class CreateRandomName {
	
	public static void main(String[] args) {
		// 문자열 배열 생성
		String a[] = {"고양이", "강아지", "말", "로빈", "참새", "리트리버", "기러기", "뱀", "햄스터", "토끼", 
				"기린", "코뿔소", "노루", "고라니", "부엉이", "두더지", "담비", "족제비", "아르마딜로", "구렁이", 
				"돼지", "호랑이", "용", "황소", "찍찍이", "사자", "오소리", "두꺼비", "라마", "달팽이"}; 
		String b[] = new String[a.length];
		
		// 복사
		System.arraycopy(a, 0, b, 0, a.length);
		
		// 섞기
		Random rand = new Random();
		for (int i = b.length -1; i > 0; i--) {
			int randIdx = rand.nextInt(i+1);
			String temp = b[randIdx];
			b[randIdx] = b[i];
			b[i] = temp;
		}
		
		// 출력
		System.out.println(Arrays.deepToString(a));
		System.out.println(Arrays.deepToString(b));
	}
	

}
