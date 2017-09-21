package bbscmt;

public class CmtDTO {
	private int cbbsno;
	private int cmtno;
	private String id;
	private String content;
	private String passwd;
	private String wdate;
	
	
	
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getCbbsno() {
		return cbbsno;
	}
	public void setCbbsno(int cbbsno) {
		this.cbbsno = cbbsno;
	}
	public int getCmtno() {
		return cmtno;
	}
	public void setCmtno(int cmtno) {
		this.cmtno = cmtno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	
};