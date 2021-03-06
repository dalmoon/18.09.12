package com.test.service;

import java.util.HashMap;
import java.util.List;

import com.test.dvo.CCodemngVO;
import com.test.dvo.CodemngVO;
import com.test.dvo.DetailVO;
import com.test.dvo.ItVO;
import com.test.dvo.ItVOO;
import com.test.dvo.JoinVO;
import com.test.dvo.UserVO;

public interface UserService {
	
	public UserVO login(UserVO vo) throws Exception;
	public UserVO idck(String id) throws Exception;
	public int uinsert(JoinVO vo) throws Exception;
	public int idDuplChk(String id) throws Exception;
	public int udetail(DetailVO vo) throws Exception;
	public List<CodemngVO> ulist(CodemngVO vo) throws Exception;
	public CodemngVO uulist(CodemngVO vo) throws Exception;
	public int update(CodemngVO vo) throws Exception;
	public int insert(CodemngVO vo) throws Exception;
	public CodemngVO iselect(CodemngVO vo) throws Exception;
	public List<ItVO> itlist(ItVO vo) throws Exception;
	/*public ItVO ittlist(ItVO vo) throws Exception;*/
	public ItVO ituulist(ItVO vo) throws Exception;
	public List<ItVO> iitlist(String project) throws Exception;
	public List<ItVO> search(HashMap<String, Object> map) throws Exception;
	public List<ItVO> fulllist2list(ItVO vo) throws Exception;
	public ItVO ittlist(ItVO vo) throws Exception;
	public ItVOO itlist2(ItVOO voo) throws Exception;
	public int itlogout1(HashMap<String, Object> map) throws Exception;
	public int itlogout2(HashMap<String, Object> map) throws Exception;
	public ItVOO itlogout3(ItVOO vo) throws Exception;
	public int itin1(HashMap<String, Object> map) throws Exception;
	public ItVO ittlist2(String tr1) throws Exception;
	public int itin2(HashMap<String, Object> map) throws Exception;
}
