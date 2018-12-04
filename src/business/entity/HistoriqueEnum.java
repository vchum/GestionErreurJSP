package business.entity;

public enum HistoriqueEnum {
	
	LECTURE(1),
	COMMENTAIRE(2),
	TRAITEMENT(3),
	SUPRESSION(4);
	
	int id;
	
	private HistoriqueEnum(int id) {
		this.id = id;
	}
	
	public int getValue() {
		return id;
	}

}
