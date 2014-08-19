package com.halici.e_secmen.model;

import android.util.Log;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;





public class Sorgulama {
	
	
	//webServisin yeri
	final static String NAMESPACE="http://tempuri.org/";
			 
	// kullan�lan metot
	//final static String METHOD_NAME_LOGIN="ESANDIK_Login";
	final static String METHOD_NAME_LOGIN="ESECMEN_LoginKontrol";
	final static String METHOD_NAME_SANDIK_YERI="SandikYeriSorgula_v3";
			 
	// soap_action
	//final static String SOAP_ACTION_LOGIN="http://tempuri.org/ESANDIK_Login";
	final static String SOAP_ACTION_LOGIN="http://tempuri.org/ESECMEN_LoginKontrol";
	final static String SOAP_ACTION_SANDIK_YERI="http://tempuri.org/SandikYeriSorgula_v3";
			 
	// webservise ait url tanimlamas�
	final static String URL = "http://bilisim.chp.org.tr/MobilService.asmx";
	
	
	String tckn;
	String babaAdi;
	
	
	public Sorgulama(String tckn, String babaAdi) {
		this.tckn = tckn;
		this.babaAdi = babaAdi;
	}
	
	public String bilgileriAl(){
		String sonuc = null;
		// soap nesnesi
		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME_SANDIK_YERI);
		
		System.out.println("******Sorgulama: "+this.tckn+", "+this.tckn+", "+this.babaAdi);
		
		// requeste bilgi ekleniyor.
		request.addProperty("esecmenTckn", this.tckn);
		request.addProperty("esecmenBabaAdi", this.babaAdi);
					
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
			aht.call(SOAP_ACTION_SANDIK_YERI, soapEnvelope);
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
