@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZGKG_BOOKINGSUPPL as select from /dmo/book_suppl

//The below association is to refer the parent which is Booking (ZGKG_BOOKING)
association to parent  ZGKG_BOOKING as _Booking on
$projection.BookingId = _Booking.BookingId and 
$projection.TravelId = _Booking.TravelId 

association[1..1] to ZGKG_TRAVEL as _Travel on //
$projection.TravelId = _Travel.TravelId

association[1..1] to /DMO/I_Supplement as _Supplement on
$projection.BookingSupplementId = _Supplement.SupplementID

association[1..*] to /DMO/I_SupplementText as _SupplementText on
$projection.SupplementId = _SupplementText.SupplementID

{
    key travel_id as TravelId,
    key booking_id as BookingId,
    key booking_supplement_id as BookingSupplementId,
    supplement_id as SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    currency_code as CurrencyCode,
    _Travel,
    _Supplement,
    _SupplementText,
    _Booking
}
