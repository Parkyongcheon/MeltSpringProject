package global.sesoc.melt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.melt.vo.Userinfo;


@Repository
public class UserinfoDAO {
	@Autowired
	SqlSession session;
	
	public int insertUserinfo(Userinfo userinfo) {
		
		int result = 0;
		UserinfoMapper mapper = session.getMapper(UserinfoMapper.class);
		
		result = mapper.insert(userinfo);
		
		return result;
		
	}
	
	public boolean getuser(String id)
	{
		int result = 0;
		UserinfoMapper mapper = session.getMapper(UserinfoMapper.class);
		
		result = mapper.getuser(id);
		
		if (result > 0)
			return true;
		else
			return false;
	}
	
	public int changenick(Userinfo userinfo)
	{
		int result = 0;
		UserinfoMapper mapper = session.getMapper(UserinfoMapper.class);
		
		result = mapper.changenick(userinfo);
		
		return result;
	}
	
	public String getnickname(String id)
	{
		String result = "";
		UserinfoMapper mapper = session.getMapper(UserinfoMapper.class);

		result = mapper.getnickname(id);
		
		return result;
	}
	
	public int inprofile(Userinfo userinfo)
	{
		int result = 0;
		UserinfoMapper mapper = session.getMapper(UserinfoMapper.class);
		
		result = mapper.inprofile(userinfo);
		
		return result;
	}
	
	public String getfile(String id)
	{
		String result = "";
		UserinfoMapper mapper = session.getMapper(UserinfoMapper.class);
		
		result = mapper.getfile(id);
		
		return result;
	}
	
}
