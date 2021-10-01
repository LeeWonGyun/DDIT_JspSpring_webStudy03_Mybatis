package kr.or.ddit.vo;

public class FileManagerVO {

	private String select;
	private String radio;
	
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getRadio() {
		return radio;
	}
	public void setRadio(String radio) {
		this.radio = radio;
	}
	
	@Override
	public String toString() {
		return "FileManagerVO [select=" + select + ", radio=" + radio + "]";
	}
	
	
}
