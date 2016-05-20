package com.sist.member;

import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import java.util.*;
@Repository
public class MemberDAO {
	private MongoClient mc;
	private DB db;
	private DBCollection dbc;
	public MemberDAO(){
		try{
			// ������ ����
			mc=new MongoClient("211.238.142.23:27017");
			// �����ͺ��̽� �ϱ�
			db=mc.getDB("sist"); // use mydb
			// �÷��� ����
			dbc=db.getCollection("sist_member");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public List<MemberVO> MemberAllData(){
		List<MemberVO> list=new ArrayList<MemberVO>();
		try{
			
			DBCursor cursor=dbc.find();
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				MemberVO vo=new MemberVO();
				vo.setId(obj.getString("id"));
				vo.setPwd(obj.getString("pwd"));
				vo.setMy_artist(obj.getString("my_artist"));
				vo.setMy_genre(obj.getString("my_genre"));
				list.add(vo);
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MemberDAO dao=new MemberDAO();
		List<MemberVO> list=dao.MemberAllData();
		System.out.println(list.get(1));
		System.out.println(list.get(2));
		System.out.println(list.get(3));
	}
}
