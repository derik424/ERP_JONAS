@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Genehmigender'
define view entity ZJL_GenehmigenderVH
  as select from zjl_mitarbeiter  
{
  key id as GenehmigenderId,
      vorname       as FirstName,
      nachname      as LastName
}

