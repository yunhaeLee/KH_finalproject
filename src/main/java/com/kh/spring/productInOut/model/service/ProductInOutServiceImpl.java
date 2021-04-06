package com.kh.spring.productInOut.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.productInOut.model.dao.ProductInOutDao;
import com.kh.spring.productInOut.model.vo.Client;
import com.kh.spring.productInOut.model.vo.Inout;
import com.kh.spring.productInOut.model.vo.Product;

@Service("proInoutService")
public class ProductInOutServiceImpl implements ProductInOutService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductInOutDao proInoutDao;
	@Override
	public ArrayList<Client> selectClientList() {
		// TODO Auto-generated method stub
		return proInoutDao.selectClientList(sqlSession);
	}
	@Override
	public int insertClient(Client client) {
		// TODO Auto-generated method stub
		return proInoutDao.insertClient(sqlSession,client);
	}
	@Override
	public Client selectClient(String cliNo) {
		// TODO Auto-generated method stub
		return proInoutDao.selectClient(sqlSession,cliNo);
	}
	@Override
	public int updateClient(Client client) {
		// TODO Auto-generated method stub
		return proInoutDao.updateClient(sqlSession,client);
	}
	@Override
	public int deleteClient(String cliNo) {
		// TODO Auto-generated method stub
		return proInoutDao.deleteClient(sqlSession,cliNo);
	}
	@Override
	public int checkClientNo(String code) {
		// TODO Auto-generated method stub
		return proInoutDao.checkClientNo(sqlSession,code);
	}
	@Override
	public ArrayList<Product> selectProductList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return proInoutDao.selectProductList(sqlSession, map);
	}
	@Override
	public int checkProductNo(String code) {
		// TODO Auto-generated method stub
		return proInoutDao.checkProductNo(sqlSession,code);
	}
	@Override
	public int insertProduct(Product product) {
		// TODO Auto-generated method stub
		return proInoutDao.insertProduct(sqlSession, product);
	}
	@Override
	public int selectProductCount(String cliNo) {
		// TODO Auto-generated method stub
		return proInoutDao.selectProductCount(sqlSession, cliNo);
	}
	@Override
	public Product selectProduct(String proNo) {
		// TODO Auto-generated method stub
		return proInoutDao.selectProduct(sqlSession,proNo);
	}
	@Override
	public int updateProduct(Product product) {
		// TODO Auto-generated method stub
		return proInoutDao.updateProduct(sqlSession,product);
	}
	@Override
	public int deleteProduct(String proNo) {
		// TODO Auto-generated method stub
		return proInoutDao.deleteProduct(sqlSession,proNo);
	}
	@Override
	public int deleteAllProduct(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return proInoutDao.deleteAllProduct(sqlSession,map);
	}
	@Override
	public ArrayList<Inout> selectInoutList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return proInoutDao.selectInoutList(sqlSession,map);
	}

	@Override
	public int insertInout(Inout inout, Product product) {
		// TODO Auto-generated method stub
		int result1 = proInoutDao.insertInout(sqlSession,inout);
		int result2 = proInoutDao.updateProduct(sqlSession,product);
		if(result1>0&&result2>0) {
			return 1;
		}else {
			return 0;
		}
		
	}
	@Override
	public int selectInoutCount() {
		// TODO Auto-generated method stub
		return proInoutDao.selectInoutCount(sqlSession);
	}
	@Override
	public Inout selectInout(String inoutNo) {
		// TODO Auto-generated method stub
		return proInoutDao.selectInout(sqlSession,inoutNo);
	}

	@Override
	public int deleteInout(String inoutNo, Product product) {
		// TODO Auto-generated method stub
		int result1 = proInoutDao.deleteInout(sqlSession,inoutNo);
		int result2 = proInoutDao.updateProduct(sqlSession,product);
		if(result1>0&&result2>0) {
			return 1;
		}else {
			return 0;
		}
	}

}
