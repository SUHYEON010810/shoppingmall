package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.productService;
import egovframework.example.sample.service.productVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("productService")
public class productServiceImpl extends EgovAbstractServiceImpl implements productService{

	@Resource(name="productDAO")
	private productDAO productDAO;

	/* 상품 추가 */
	@Override
	public String InsertProduct(productVO vo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.InsertProduct(vo);
	}

	/* 상품 리스트 */
	@Override
	public List<?> SelectproductList(productVO vo) throws Exception{
		// TODO Auto-generated method stub
		return productDAO.SelectproductList(vo);
	}



}
