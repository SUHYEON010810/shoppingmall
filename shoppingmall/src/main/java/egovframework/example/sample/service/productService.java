package egovframework.example.sample.service;

import java.util.List;

public interface productService {

	String InsertProduct(productVO vo) throws Exception;

	List<?> SelectproductList(productVO vo) throws Exception;

	productVO seleteproductData(int prodnum) throws Exception;

	int productDelect(int prodnum)throws Exception;

	int updateproduct(productVO vo)throws Exception;

	int selectTotal(productVO vo)throws Exception;;


}
