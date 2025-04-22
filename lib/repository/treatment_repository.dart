import 'package:imtihon_3/data_sourses/remote_datasoerse/treatment_remote_datasource.dart';
import 'package:imtihon_3/models/treatment_model.dart';

class TreatmentRepository {
  final TreatmentRemoteDatasource treatmentRemote = TreatmentRemoteDatasource();

  Future<List<TreatmentModel>> getTreatments() async {
    return treatmentRemote.getData();
  }

  Future<bool> addTreatment(TreatmentModel data) async {
    return treatmentRemote.addTreatment(data);
  }

  Future<bool> updateTreatment(TreatmentModel data) async {
    return treatmentRemote.updateTreatment(data);
  }
}
