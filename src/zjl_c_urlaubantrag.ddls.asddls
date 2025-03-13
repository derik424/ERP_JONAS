@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BO Projectionview'
@Search.searchable: true
@Metadata.allowExtensions: true
  define view entity ZJL_C_URLAUBANTRAG 
        as projection on ZJL_R_URLAUBANTRAG
{
    
    // Teil des services, API die im Frontend angezeigt werden
    key Id,
    Antragsteller,
 @Consumption.valueHelpDefinition: [{ entity: { name: 'ZJL_GenehmigenderVH', element: 'GenehmigenderId' } }]
      Genehmigender,
    Startdatum,
    Enddatum,
    Urlaubstage,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    Kommentar,
    
    
    @ObjectModel.text.element: [ 'statusausgeschrieben' ]
    Status, 
    statusausgeschrieben, 
    
    ErstelltAm,
    ErstelltVon,
    GeaendertAm,
    GeaendertVon,
    
    
  
    
    
    /* Associations */
    _Antragsteller : redirected to parent ZJL_C_MITARBEITER
   
    
  
}

//die redirects sind nicht drin
