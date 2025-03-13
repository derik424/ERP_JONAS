CLASS zjl_nachrichten DEFINITION PUBLIC
  INHERITING FROM cx_static_check FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    " Interfaces
    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    " Message Constants
    CONSTANTS:
      BEGIN OF sucess_genehmigen,
        msgid TYPE symsgid      VALUE 'ZJL_NACHRICHTEN',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF sucess_genehmigen.

    CONSTANTS:
      BEGIN OF sucess_ablehnen,
        msgid TYPE symsgid      VALUE 'ZJL_NACHRICHTEN',
        msgno TYPE symsgno      VALUE '002',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF sucess_ablehnen.

    CONSTANTS:
      BEGIN OF error_again,
        msgid TYPE symsgid      VALUE 'ZJL_NACHRICHTEN',
        msgno TYPE symsgno      VALUE '003',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF error_again.


    " Attributs
    DATA user_name   TYPE syuname.
    DATA agency_id   TYPE /dmo/agency_id.
    DATA customer_id TYPE /dmo/customer_id.
    DATA description TYPE zjl_kommentar.

    " Constructor
    METHODS constructor
      IMPORTING
        severity     TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid       LIKE if_t100_message=>t100key         DEFAULT if_t100_message=>default_textid
        !previous    LIKE previous                         OPTIONAL
        user_name    TYPE syuname                          OPTIONAL
        agency_id    TYPE /dmo/agency_id                   OPTIONAL
        customer_id  TYPE /dmo/customer_id                 OPTIONAL
        !description TYPE zjl_kommentar               OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZJL_NACHRICHTEN IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    if_abap_behv_message~m_severity = severity.
    me->user_name   = user_name.
    me->agency_id   = agency_id.
    me->customer_id = customer_id.
    me->description = description.
  ENDMETHOD.
ENDCLASS.
