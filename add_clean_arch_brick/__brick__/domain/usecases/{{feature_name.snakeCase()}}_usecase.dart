import 'package:{{project_name.snakeCase()}}/core/usecase/base_usecase.dart';
{{#needs_contract}}import 'package:{{project_name.snakeCase()}}/domain/contracts/{{feature_name.snakeCase()}}_contract.dart';{{/needs_contract}}

class Get{{feature_name.pascalCase()}}UseCase extends BaseUseCase<List<{{feature_name.pascalCase()}}>>, NoParams> {
  {{#needs_contract}}final {{feature_name.pascalCase()}}Contract _contract;
  
  Get{{feature_name.pascalCase()}}UseCase(this._contract);{{/needs_contract}}
  {{^needs_contract}}Get{{feature_name.pascalCase()}}UseCase();{{/needs_contract}}
  
  @override
  Future<List<{{feature_name.pascalCase()}}>> call(NoParams params) async {
    {{#needs_contract}}return await _contract.get{{feature_name.pascalCase()}}s();{{/needs_contract}}
    {{^needs_contract}}// Implement use case logic directly here
    return [];{{/needs_contract}}
  }
} 