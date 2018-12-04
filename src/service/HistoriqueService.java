package service;

import java.util.ArrayList;
import java.util.List;

import business.entity.Historique;
import entity.ErrorItem;

public class HistoriqueService {
	
	private List<Historique> listH = new ArrayList<>();
	
	public List<Historique> list(){
		return listH;
	}	
	
	public void addHistory(ErrorItem eri) {
		listH.add(new Historique(eri.getType(), eri.getLabel(), eri.getStatus()));
	}

}
