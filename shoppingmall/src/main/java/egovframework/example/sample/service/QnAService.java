package egovframework.example.sample.service;

import java.util.List;

public interface QnAService {

	List<?> SelectproductList(QnAVO vo) throws Exception;

	String InsertQnA(QnAVO vo)throws Exception;

	List<?> SelectQnAList(QnAVO vo)throws Exception;

	QnAVO seleteQnAData(int qseq)throws Exception;


}
