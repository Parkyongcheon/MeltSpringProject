
package global.sesoc.melt.vo;

public class Userinfo {
	//lombok 안되서 getter setter tostring 직접 생성
	private String id;
	private String name;
	private String nickname;
	private String oprofile;
	private String sprofile;
	
	public Userinfo() {};
	
	public Userinfo(String id, String name, String nickname, String oprofile, String sprofile) 
	{
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.oprofile = oprofile;
		this.sprofile = sprofile;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getOprofile() {
		return oprofile;
	}

	public void setOprofile(String oprofile) {
		this.oprofile = oprofile;
	}

	public String getSprofile() {
		return sprofile;
	}

	public void setSprofile(String sprofile) {
		this.sprofile = sprofile;
	}

	@Override
	public String toString() {
		return "Userinfo [id=" + id + ", name=" + name + ", nickname=" + nickname + ", oprofile=" + oprofile
				+ ", sprofile=" + sprofile + "]";
	}
	
	
	
}
