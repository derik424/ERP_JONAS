@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BO Baseview Urlaubsanträge'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZJL_R_URLAUBANTRAG
  as select from zjl_urlaubantrag
  association to parent ZJL_R_MITARBEITER as _Antragsteller on $projection.Antragsteller = _Antragsteller.ID
{
   key id            as Id,
       antragsteller as Antragsteller,
       genehmigender as Genehmigender,
       startdatum    as Startdatum,
       enddatum      as Enddatum,
       dats_days_between(startdatum, enddatum) as Urlaubstage,
       kommentar     as Kommentar,
       status        as Status,
       erstellt_am   as ErstelltAm,
       erstellt_von  as ErstelltVon,
       geaendert_am  as GeaendertAm,
       geaendert_von as GeaendertVon,

       
      case status when 'B' then 'Beantragt'
when 'A' then 'Abgelehnt'
else 'Genehmigt'
end as statusausgeschrieben,  
        
       _Antragsteller
}
