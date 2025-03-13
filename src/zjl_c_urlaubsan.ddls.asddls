@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projectionview'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZJL_C_URLAUBSAN as projection on ZJL_R_URLAUBSAN
{
 key Id,
Mitarbeiter,
Jahr,
Urlaubstage,
ErstelltAm,
ErstelltVon,
GeaendertAm,
GeaendertVon,
urlaubstage_verbraucht,
verfuegbare_urlaubstage,
geplante_urlaubstage,
/* Associations */
_Mitarbeiter : redirected to parent ZJL_C_MITARBEITER
}

// der redirect fehlt
