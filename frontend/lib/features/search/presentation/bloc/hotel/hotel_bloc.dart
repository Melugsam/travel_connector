import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_connector/features/search/domain/entity/hotel_entity.dart';
import 'package:travel_connector/features/search/domain/usecase/hotel_usecase.dart';

part 'hotel_event.dart';

part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelUseCase _hotelUseCase;

  HotelBloc(this._hotelUseCase) : super(HotelInitial()) {
    on<FetchHotelEvent>(
      (event, emit) async {
        emit(HotelLoading());
        final now = DateTime.now();
        final checkIn = DateFormat('yyyy-MM-dd').format(
          now.add(
            Duration(days: 1),
          ),
        );
        final checkOut = DateFormat('yyyy-MM-dd').format(
          now.add(
            Duration(days: 7),
          ),
        );
        final result = await _hotelUseCase(
          event.latitude,
          event.longitude,
          checkIn,
          checkOut,
        );
        result.fold(
          (l) => emit(
            HotelError(message: l.message),
          ),
          (r) {
            if (r.isEmpty) {
              emit(HotelEmpty());
            } else {
              emit(
                HotelSuccess(hotels: r),
              );
            }
          },
        );
      },
    );
  }
}
