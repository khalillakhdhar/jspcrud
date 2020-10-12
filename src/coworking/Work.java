package coworking;

import java.sql.SQLException;

import javax.swing.JOptionPane;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;



public class Work {
String titre,description;
int id;



public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getTitre() {
	return titre;
}

public void setTitre(String titre) {
	this.titre = titre;
}



public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public Work(String titre, String description, int id) {
	super();
	this.titre = titre;
	this.description = description;
	this.id = id;
}

public Work(String titre, String description) {
	super();
	this.titre = titre;
	this.description = description;
}

public ResultSet lister() {
	// TODO Auto-generated method stub
try {
		
		Connexion c=new Connexion();
	PreparedStatement pst;
	
		pst = (PreparedStatement) c.conn.prepareStatement("SELECT * FROM  work");

	pst.executeQuery();
	ResultSet rs = (ResultSet) pst.executeQuery();
	return rs;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	}	
}

public Work() {
	super();
}

public void add() {
	// TODO Auto-generated method stub
	try {
		// TODO add your handling code here:
		Connexion c= new Connexion();
		java.sql.PreparedStatement statement = c.conn.prepareStatement("INSERT INTO `work`(`titre`,`description`) VALUES  ('"+this.titre+"','"+this.description+"')");
		statement.executeUpdate();
		
		//JOptionPane.showMessageDialog(null,"Ajouté avec			succés","",JOptionPane.INFORMATION_MESSAGE);
		} catch (SQLException ex) {
	//	JOptionPane.showMessageDialog(null, ex);
		
		}
}


public void update()
{
	try {
		// TODO add your handling code here:
		Connexion c= new Connexion();
		String sql="UPDATE `work` SET `titre`='"+this.titre+"' ,`description`='"+this.description+"' ,`id`='"+this.id+"' WHERE	`id`='"+this.id+"';";
		java.sql.PreparedStatement statement = c.conn.prepareStatement(sql);
		statement.executeUpdate();
		;
		//JOptionPane.showMessageDialog(null,"Modifié avec		succés","",JOptionPane.INFORMATION_MESSAGE);
		} catch (SQLException ex) {
		JOptionPane.showMessageDialog(null, ex); }	

}

public void delete()
{
	try {
		// TODO add your handling code here:
		Connexion c= new Connexion();
		String sql = "DELETE FROM `work` WHERE `id`=?";
		java.sql.PreparedStatement statement = c.conn.prepareStatement(sql);
		statement.setInt(1, this.id);
		statement.execute();
		//JOptionPane.showMessageDialog(null,"Supprimé avec		succés","",JOptionPane.INFORMATION_MESSAGE);
		} catch (SQLException ex) {
	//	JOptionPane.showMessageDialog(null, ex); 
		
		
		}	

}

}
