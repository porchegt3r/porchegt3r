package img;

public class ImgTest {

	public static void main(String[] args) {
		ImgDAO dao = new ImgDAO();
		delete(dao);
		
	}
	
	private static void delete(ImgDAO dao){
		int imgno = 1;
		if(dao.delete(imgno)){
		p("성공")	;	
	}else{
		p("실패");
	}

}

	private static void p(String string) {
		System.out.println(string);
	}
}
