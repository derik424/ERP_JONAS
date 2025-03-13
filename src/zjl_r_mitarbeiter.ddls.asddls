@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BO Baseview Mitarbeiter'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZJL_R_MITARBEITER
  as select from zjl_mitarbeiter
  composition [0..*] of ZJL_R_URLAUBSAN as _URLAUBSAN
  composition [0..*] of ZJL_R_URLAUBANTRAG as _URLAUBANTRAG
{
  key id             as ID,
      mitarbeiter_nr as MitarbeiterNr,
      vorname        as Vorname,
      nachname       as Nachname,
      eintrittsdatum as Eintrittsdatum,
      erstellt_am    as ErstelltAm,
      erstellt_von   as ErstelltVon,
      geaendert_am   as GeaendertAm,
      geaendert_von  as GeaendertVon,

      _URLAUBSAN,
      _URLAUBANTRAG
}


