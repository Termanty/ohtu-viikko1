package ohtu.verkkokauppa;

public class Pankki implements PankkiApi {

    private KirjanpitoApi kirjanpito;

    public Pankki() {
    }

    public KirjanpitoApi getKirjanpito() {
        return kirjanpito;
    }

    public void setKirjanpito(KirjanpitoApi kirjanpito) {
        this.kirjanpito = kirjanpito;
    }
    
    @Override
    public boolean tilisiirto(String nimi, int viitenumero, String tililta, String tilille, int summa) {
        kirjanpito.lisaaTapahtuma("tilisiirto: tililtä " + tilille + " tilille " + tilille
                + " viite " + viitenumero + " summa " + summa + "e");

        // täällä olisi koodi joka ottaa yhteyden pankin verkkorajapintaan
        return true;
    }
}
