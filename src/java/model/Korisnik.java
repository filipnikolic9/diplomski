package model;
// Generated Sep 25, 2017 10:03:09 AM by Hibernate Tools 4.3.1


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * Korisnik generated by hbm2java
 */
@Entity
@Table(name="korisnik"
    ,catalog="domzdravlja"
)
public class Korisnik  implements java.io.Serializable {


     private int userId;
     private String korisnickoIme;
     private String korisnickaSifra;
     private String ime;
     private String prezime;
     private String mail;
     private List<Osiguranolice> osiguranolicesForNadlezniLekar = new ArrayList<>();
     private List<Pregled> pregledsForOsiguranoLice = new ArrayList<>();
     private Osiguranolice osiguranoliceByUserId;
     private List<Pregled> pregledsForMedicinskaSestra = new ArrayList<>();
     private List<Zahtev> zahtevs =new ArrayList<>();
     private Lekar lekar;
     private List<Raspored> rasporeds =new ArrayList<>();
     private List<Uloge> uloges = new ArrayList<>();
     private Sestra sestra;

    public Korisnik() {
    }

	
    public Korisnik(int userId, String korisnickoIme, String korisnickaSifra, String ime, String prezime) {
        this.userId = userId;
        this.korisnickoIme = korisnickoIme;
        this.korisnickaSifra = korisnickaSifra;
        this.ime = ime;
        this.prezime = prezime;
    }
    public Korisnik(int userId, String korisnickoIme, String korisnickaSifra, String ime, String prezime, String mail, List<Osiguranolice> osiguranolicesForNadlezniLekar, List<Pregled> pregledsForOsiguranoLice, Osiguranolice osiguranoliceByUserId, List<Pregled> pregledsForMedicinskaSestra, List<Zahtev> zahtevs, Lekar lekar, List<Raspored> rasporeds, List<Uloge> uloges, Sestra sestra) {
       this.userId = userId;
       this.korisnickoIme = korisnickoIme;
       this.korisnickaSifra = korisnickaSifra;
       this.ime = ime;
       this.prezime = prezime;
       this.mail = mail;
       this.osiguranolicesForNadlezniLekar = osiguranolicesForNadlezniLekar;
       this.pregledsForOsiguranoLice = pregledsForOsiguranoLice;
       this.osiguranoliceByUserId = osiguranoliceByUserId;
       this.pregledsForMedicinskaSestra = pregledsForMedicinskaSestra;
       this.zahtevs = zahtevs;
       this.lekar = lekar;
       this.rasporeds = rasporeds;
       this.uloges = uloges;
       this.sestra = sestra;
    }
   
     @Id 

    
    @Column(name="userId", unique=true, nullable=false)
    public int getUserId() {
        return this.userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }

    
    @Column(name="korisnickoIme", nullable=false, length=20)
    public String getKorisnickoIme() {
        return this.korisnickoIme;
    }
    
    public void setKorisnickoIme(String korisnickoIme) {
        this.korisnickoIme = korisnickoIme;
    }

    
    @Column(name="korisnickaSifra", nullable=false, length=20)
    public String getKorisnickaSifra() {
        return this.korisnickaSifra;
    }
    
    public void setKorisnickaSifra(String korisnickaSifra) {
        this.korisnickaSifra = korisnickaSifra;
    }

    
    @Column(name="ime", nullable=false, length=20)
    public String getIme() {
        return this.ime;
    }
    
    public void setIme(String ime) {
        this.ime = ime;
    }

    
    @Column(name="prezime", nullable=false, length=20)
    public String getPrezime() {
        return this.prezime;
    }
    
    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    
    @Column(name="mail", length=20)
    public String getMail() {
        return this.mail;
    }
    
    public void setMail(String mail) {
        this.mail = mail;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="korisnikByNadlezniLekar")
    public List<Osiguranolice> getOsiguranolicesForNadlezniLekar() {
        return this.osiguranolicesForNadlezniLekar;
    }
    
    public void setOsiguranolicesForNadlezniLekar(List<Osiguranolice> osiguranolicesForNadlezniLekar) {
        this.osiguranolicesForNadlezniLekar = osiguranolicesForNadlezniLekar;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="korisnikByOsiguranoLice")
    public List<Pregled> getPregledsForOsiguranoLice() {
        return this.pregledsForOsiguranoLice;
    }
    
    public void setPregledsForOsiguranoLice(List<Pregled> pregledsForOsiguranoLice) {
        this.pregledsForOsiguranoLice = pregledsForOsiguranoLice;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="korisnikByUserId")
    public Osiguranolice getOsiguranoliceByUserId() {
        return this.osiguranoliceByUserId;
    }
    
    public void setOsiguranoliceByUserId(Osiguranolice osiguranoliceByUserId) {
        this.osiguranoliceByUserId = osiguranoliceByUserId;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="korisnikByMedicinskaSestra")
    public List<Pregled> getPregledsForMedicinskaSestra() {
        return this.pregledsForMedicinskaSestra;
    }
    
    public void setPregledsForMedicinskaSestra(List<Pregled> pregledsForMedicinskaSestra) {
        this.pregledsForMedicinskaSestra = pregledsForMedicinskaSestra;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="korisnik")
    public List<Zahtev> getZahtevs() {
        return this.zahtevs;
    }
    
    public void setZahtevs(List<Zahtev> zahtevs) {
        this.zahtevs = zahtevs;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="korisnik")
    public Lekar getLekar() {
        return this.lekar;
    }
    
    public void setLekar(Lekar lekar) {
        this.lekar = lekar;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="korisnik")
    public List<Raspored> getRasporeds() {
        return this.rasporeds;
    }
    
    public void setRasporeds(List<Raspored> rasporeds) {
        this.rasporeds = rasporeds;
    }

@ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="useruloga", catalog="domzdravlja", joinColumns = { 
        @JoinColumn(name="userId", nullable=false, updatable=false) }, inverseJoinColumns = { 
        @JoinColumn(name="ulogaId", nullable=false, updatable=false) })
    public List<Uloge> getUloges() {
        return this.uloges;
    }
    
    public void setUloges(List<Uloge> uloges) {
        this.uloges = uloges;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="korisnik")
    public Sestra getSestra() {
        return this.sestra;
    }
    
    public void setSestra(Sestra sestra) {
        this.sestra = sestra;
    }

}

