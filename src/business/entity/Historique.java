package business.entity;

public class Historique {
	
	private String type_error;
	private String label_error;
	private int label_operation;
	
	public Historique() {
		
	}
	
	

	public Historique(String type_error, String label_error, int label_operation) {
		this.type_error = type_error;
		this.label_error = label_error;
		this.label_operation = label_operation;
	}



	public String getType_error() {
		return type_error;
	}

	public void setType_error(String type_error) {
		this.type_error = type_error;
	}

	public String getLabel_error() {
		
		return label_error;
	}

	public void setLabel_error(String label_error) {
		this.label_error = label_error;
	}

	public int getLabel_operation() {
		return label_operation;
	}

	public void setLabel_operation(int label_operation) {
		this.label_operation = label_operation;
	}
	
	

}
