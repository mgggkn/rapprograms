@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Projection'
@Metadata.ignorePropagatedAnnotations: true
define  view entity ZGKG_BOOKINGSUP_PROJ as projection on ZGKG_BOOKINGSUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    /* Associations */
    _Booking : redirected to parent ZGKG_BOOKING_PROJ,
    _Supplement,
    _SupplementText,
    _Travel
    
}
