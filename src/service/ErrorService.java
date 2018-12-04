package service;

import java.util.List;

import business.entity.Historique;
import dao.ErrorDao;
import entity.ErrorItem;

public class ErrorService {
	
	
	ErrorDao erd = new ErrorDao();
	
	
	public ErrorService() {
		
	}
	
	
	public List<ErrorItem> list(){
		return erd.list();
	}
	
	public void delete(long id) throws Exception {
		erd.delete(id);
	}
	
	public ErrorItem getById(long id) {
		return erd.getById(id);
		
	}
	
	public void updateCommentaire(long id, String com) {
		erd.getById(id).setCommentaire(com);
		erd.getById(id).setStatus(ErrorItem.STATUS_COMM);
		
	}
	
	public void traitmentErrorClear(long id) {
		erd.getById(id).setStatus(ErrorItem.STATUS_PROCESSED);
	}
	
	public void readError(long id) {
		erd.getById(id).setStatus(ErrorItem.STATUS_READ);
	}
	
	public void removeAllProcesses(ErrorItem eri, List<Historique> listH) {
		for(int i = 0; i < list().size() ; i++){
			if(list().get(i).getStatus() == 3){
				eri = list().get(i);
				list().remove(i);
				eri.setStatus(4);
				listH.add(new Historique(eri.getType(), eri.getLabel(), eri.getStatus()));
			}
		}
	}
}
