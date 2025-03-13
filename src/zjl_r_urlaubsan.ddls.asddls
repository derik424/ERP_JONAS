@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BO Baseview Urlaubsanspruch'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZJL_R_URLAUBSAN
  as select from zjl_urlaubsan
  as u left outer join zjl_urlaubantrag as a on u.mitarbeiter = a.antragsteller
  association to parent ZJL_R_MITARBEITER as _Mitarbeiter on $projection.Mitarbeiter = _Mitarbeiter.ID
{
   key u.id         as Id,
       u.mitarbeiter as Mitarbeiter,
       u.jahr        as Jahr,
       u.urlaubstage as Urlaubstage,
       u.erstellt_am as ErstelltAm,
       u.erstellt_von as ErstelltVon,
       u.geaendert_am as GeaendertAm,
       u.geaendert_von as GeaendertVon,
       sum( case when a.status = 'G' then a.urlaubstage else 0 end ) as urlaubstage_verbraucht,
       sum(u.urlaubstage - ( case when a.status = 'G' then a.urlaubstage else 0 end )) as verfuegbare_urlaubstage,
       sum( case when a.status = 'B' then a.urlaubstage else 0 end) as geplante_urlaubstage,
       _Mitarbeiter
}
group by 
   u.id,
   u.mitarbeiter,
   u.jahr,
   u.urlaubstage,
   u.erstellt_am,
   u.erstellt_von,
   u.geaendert_am,
   u.geaendert_von
 
