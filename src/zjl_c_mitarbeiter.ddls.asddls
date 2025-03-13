@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projectionview'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZJL_C_MITARBEITER 
provider contract transactional_query
as projection on ZJL_R_MITARBEITER 
{ 
   key ID,
   MitarbeiterNr,
    @Search.defaultSearchElement: true
   @Search.fuzzinessThreshold: 0.7
   Vorname,
 @Search.defaultSearchElement: true
   @Search.fuzzinessThreshold: 0.7
   Nachname,
   Eintrittsdatum,
   ErstelltAm,
   ErstelltVon,
   GeaendertAm,
   GeaendertVon,

   /* Associations */
   _URLAUBANTRAG : redirected to composition child ZJL_C_URLAUBANTRAG,
   _URLAUBSAN : redirected to composition child ZJL_C_URLAUBSAN
}
