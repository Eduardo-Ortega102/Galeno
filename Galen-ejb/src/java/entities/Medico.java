package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "MEDICO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Medico.findAll", query = "SELECT m FROM Medico m")
    , @NamedQuery(name = "Medico.findByColegiado", query = "SELECT m FROM Medico m WHERE m.colegiado = :colegiado")
    , @NamedQuery(name = "Medico.findByNombre", query = "SELECT m FROM Medico m WHERE m.nombre = :nombre")
    , @NamedQuery(name = "Medico.findByApellido", query = "SELECT m FROM Medico m WHERE m.apellido = :apellido")
    , @NamedQuery(name = "Medico.findByDni", query = "SELECT m FROM Medico m WHERE m.dni = :dni")
    , @NamedQuery(name = "Medico.findByTelefono", query = "SELECT m FROM Medico m WHERE m.telefono = :telefono")
    , @NamedQuery(name = "Medico.findByEmail", query = "SELECT m FROM Medico m WHERE m.email = :email")
    , @NamedQuery(name = "Medico.findByPassword", query = "SELECT m FROM Medico m WHERE m.password = :password")
    , @NamedQuery(name = "Medico.findByLocalizacion", query = "SELECT m FROM Medico m WHERE m.localizacion = :localizacion")})
public class Medico implements Serializable, User {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "ESPECIALIDAD")
    private String especialidad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "MINUTOSCONSULTA")
    private int minutosconsulta;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "medico")
    private Collection<Horario> horarioCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "medico")
    private Collection<Cita> citaCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "medico")
    private Collection<Historia> historiaCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "COLEGIADO")
    private String colegiado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "NOMBRE")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "APELLIDO")
    private String apellido;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "DNI")
    private String dni;
    @Basic(optional = false)
    @NotNull
    @Column(name = "TELEFONO")
    private int telefono;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "EMAIL")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "PASSWORD")
    private String password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "LOCALIZACION")
    private String localizacion;

    public Medico() {
    }

    public Medico(String colegiado) {
        this.colegiado = colegiado;
    }

    public Medico(String colegiado, String nombre, String apellido, String dni, int telefono, String email, String password, String localizacion, String especialidad, int minutosconsulta) {
        this.colegiado = colegiado;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.telefono = telefono;
        this.email = email;
        this.password = password;
        this.localizacion = localizacion;
        this.especialidad = especialidad;
        this.minutosconsulta = minutosconsulta;
    }
    
    

    public String getColegiado() {
        return colegiado;
    }

    public void setColegiado(String colegiado) {
        this.colegiado = colegiado;
    }

    @Override
    public String getNombre() {
        return nombre;
    }

    @Override
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String getApellido() {
        return apellido;
    }

    @Override
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    @Override
    public String getDni() {
        return dni;
    }

    @Override
    public void setDni(String dni) {
        this.dni = dni;
    }

    @Override
    public int getTelefono() {
        return telefono;
    }

    @Override
    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public void setPassword(String password) {
        this.password = password;
    }

    public String getLocalizacion() {
        return localizacion;
    }

    public void setLocalizacion(String localizacion) {
        this.localizacion = localizacion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (colegiado != null ? colegiado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Medico)) return false;
        Medico other = (Medico) object;
        return !((this.colegiado == null && other.colegiado != null) || (this.colegiado != null && !this.colegiado.equals(other.colegiado)));
    }

    @Override
    public String toString() {
        return "entities.Medico[ colegiado=" + colegiado + " ]";
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getMinutosconsulta() {
        return minutosconsulta;
    }

    public void setMinutosconsulta(int minutosconsulta) {
        this.minutosconsulta = minutosconsulta;
    }

    @XmlTransient
    public Collection<Horario> getHorarioCollection() {
        return horarioCollection;
    }

    public void setHorarioCollection(Collection<Horario> horarioCollection) {
        this.horarioCollection = horarioCollection;
    }

    @XmlTransient
    @Override
    public Collection<Cita> getCitaCollection() {
        return citaCollection;
    }
        
    @Override
    public void setCitaCollection(Collection<Cita> citaCollection) {
        this.citaCollection = citaCollection;
    }

    @XmlTransient
    public Collection<Historia> getHistoriaCollection() {
        return historiaCollection;
    }

    public void setHistoriaCollection(Collection<Historia> historiaCollection) {
        this.historiaCollection = historiaCollection;
    }
}