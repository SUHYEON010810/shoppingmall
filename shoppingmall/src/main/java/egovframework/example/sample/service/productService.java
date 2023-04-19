package egovframework.example.sample.service;

import java.util.List;

public interface productService {

	String InsertProduct(productVO vo) throws Exception;

	List<?> SelectproductList(productVO vo) throws Exception;


}
