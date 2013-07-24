package com.halici.e_secmen.siniflar;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

import android.util.Log;

public class Sorgulama {
	String tckn,babaAdi;

	public Sorgulama(String tckn,String babaAdi) {
		this.tckn=tckn;
		this.babaAdi=babaAdi;
	}

	// webServisin yeri
	final static String NAMESPACE="http://tempuri.org/";
			 
	// kullanılan metot
	final static String METHOD_NAME="ESECMEN_Login";
			 
	// soap_action
	final static String SOAP_ACTION="http://tempuri.org/ESECMEN_Login";
			 
	// webservise ait url tanimlaması
	final static String URL = "http://bilisim.chp.org.tr/MobilService.asmx";
	
	
	public String bilgileriAl(){
		String sonuc = null;
		// soap nesnesi
		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME);
		
		// requeste bilgi ekleniyor.
		request.addProperty("tckn", this.tckn);
		request.addProperty("babaAdi", this.babaAdi);
					
		//Web servisin versiyonunu bildiriyoruz.
		SoapSerializationEnvelope soapEnvelope = new SoapSerializationEnvelope(SoapEnvelope.VER12);
					
		//don.net ile hazırlandığı için
		soapEnvelope.dotNet = true;
					
		//requesti zarfa koyuoyoruz.
		soapEnvelope.setOutputSoapObject(request);
					
		//transfer değeri oluşturuyoruz
		HttpTransportSE aht = new HttpTransportSE(URL);
		aht.debug=true;
					
		try {
			System.out.println("try içindeiym.");
			
			// Ve son olarak isteğimizi gönderiyoruz.
			aht.call(SOAP_ACTION, soapEnvelope);
			aht.setXmlVersionTag("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			aht.debug=true;
					
			System.out.println("try sonu");
		} 
		catch (Exception e) {
			Log.i("hata",e.toString());
				e.printStackTrace();
		} 
		
		try {
			// Cevap olarak basit bir veri tipi beklediğimiz için,
			// cevabı SoapPrimitive nesnesi olarak alıyoruz.
			SoapPrimitive sonucSoap = (SoapPrimitive) soapEnvelope.getResponse();
			sonuc=sonucSoap.toString();
					
				
			System.out.println("Gelen Veri: ");
			System.out.println(sonuc);
		} 
		catch (Exception e) {
			System.out.println("Hata: "+e.toString());
			e.printStackTrace();
		}
		
		return sonuc;
	}


}
