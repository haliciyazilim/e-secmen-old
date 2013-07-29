package com.halici.e_secmen.siniflar;

import java.util.HashMap;

import org.json.JSONException;
import org.json.JSONObject;

public class KisiBilgileri {

	private String gelenVeri;
	
	// JSON Nodları
	private static String kisiBilgisi="KisiBilgileri";
	private static String tckn="TCKN";
	private static String ad="AdSoyad";
	private static String soyad="Soyad";
	private static String il="Il";
	private static String ilce="Ilce";
	private static String mahalle="Muhtarlik";
	private static String sandikAlani="SandikAlani";
	private static String sandikNo="SandikNo";
	private static String sandikSiraNo="SandikSiraNo";
	private static String loginDurumu="LoginDurumu";

	private static String eskiListe="EskiListe";
	private static String secimYili="SecimYili";
	
	public KisiBilgileri(String gelenVeri) {
		super();
		this.gelenVeri = gelenVeri;
	}
	
	public HashMap<String, String> veriAl(){
		HashMap<String, String> map=new HashMap<String, String>();
		
		try {
			JSONObject json= new JSONObject(this.gelenVeri);
			JSONObject kisiBilgileri=json.getJSONObject(kisiBilgisi);

			map.put("isim", kisiBilgileri.getString(ad));
//			map.put("soyisim", kisiBilgileri.getString(soyad));
//			map.put("tckn", kisiBilgileri.getString(tckn));
			map.put("il", kisiBilgileri.getString(il));
			map.put("ilce", kisiBilgileri.getString(ilce));
			map.put("mahalle", kisiBilgileri.getString(mahalle));

//			map.put("eskiListe", json.getString(eskiListe));
//			map.put("secimYili", json.getString(secimYili));			
		} catch (JSONException e) {
			e.printStackTrace();
			return null;
		}
		
		return map;
	}
}