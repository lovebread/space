import com.huangzhimin.contacts.*;
import com.huangzhimin.contacts.exception.*;

import java.util.List;

public class ContactGrabber{

	public static void main(String args[]){
		if(args.length != 3){
			System.out.println("ERROR: please specify mailbox type, user name and password");
			return;
		}
		String mailbox = args[0];
		String user_name = args[1];
		String password = args[2];
		try{
			ContactsImporter importer = null;
			if(mailbox == "gmail"){
				importer = ContactsImporterFactory.getGmailContacts(user_name, password);
			}else if(mailbox == "yahoo"){
				importer = ContactsImporterFactory.getYahooContacts(user_name, password);
			}else if(mailbox == "msn"){
				importer = ContactsImporterFactory.getMSNContacts(user_name, password);
			}else if(mailbox == "hotmail"){
				importer = ContactsImporterFactory.getHotmailContacts(user_name, password);
			}else if(mailbox == "163"){
				importer = ContactsImporterFactory.getOneSixThreeContacts(user_name, password);
			}else if(mailbox == "sina"){
				importer = ContactsImporterFactory.getSinaContacts(user_name, password);
			}else if(mailbox == "sohu"){
				importer = ContactsImporterFactory.getSohuContacts(user_name, password);
			}else if(mailbox == "tom"){
				importer = ContactsImporterFactory.getTomContacts(user_name, password);
			}else if(mailbox == "yeah"){
				importer = ContactsImporterFactory.getYeahContacts(user_name, password);
			}else if(mailbox == "189"){
				importer = ContactsImporterFactory.getOneEightNineContacts(user_name, password);
			}
			List<Contact> contacts = importer.getContacts();
			for(Contact contact : contacts) {
        System.out.println(contact.getUsername() + ": " + contact.getEmail());
			}
		}catch(ContactsException ex) {
			ex.printStackTrace();
		}
	}

}
