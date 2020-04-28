package global.sesoc.melt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import global.sesoc.melt.vo.Userinfo;



public interface UserinfoMapper {

	public int insert(Userinfo userinfo);
	public int getuser(String id);
	public int changenick(Userinfo userinfo);
	public String getnickname(String id);
	public int inprofile(Userinfo userinfo);
	public String getfile(String id);
}
