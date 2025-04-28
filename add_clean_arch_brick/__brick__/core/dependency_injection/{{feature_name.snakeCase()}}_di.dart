import 'package:{{project_name.snakeCase()}}/core/dependency_injection/di_container.dart';
{{#needs_contract}}import 'package:{{project_name.snakeCase()}}/domain/contracts/{{feature_name.snakeCase()}}_contract.dart';
import 'package:{{project_name.snakeCase()}}/data/contracts_impl/{{feature_name.snakeCase()}}_impl/{{feature_name.snakeCase()}}_impl.dart';{{/needs_contract}}
import 'package:{{project_name.snakeCase()}}/domain/usecases/{{feature_name.snakeCase()}}_usecase.dart';
{{#use_bloc}}import 'package:{{project_name.snakeCase()}}/presentation/{{feature_name.snakeCase()}}/blocs/{{feature_name.snakeCase()}}_bloc.dart';{{/use_bloc}}

void setup{{feature_name.pascalCase()}}Dependencies() {
  final di = DIContainer();
  
  // Register sources
  di.register<{{feature_name.pascalCase()}}Source>({{feature_name.pascalCase()}}Source());
  
  {{#needs_contract}}// Register contracts
  di.register<{{feature_name.pascalCase()}}Contract>(
    {{feature_name.pascalCase()}}Impl(di.get<{{feature_name.pascalCase()}}Source>()),
  );{{/needs_contract}}
  
  // Register use cases
  di.register<Get{{feature_name.pascalCase()}}UseCase>(
    Get{{feature_name.pascalCase()}}UseCase({{#needs_contract}}di.get<{{feature_name.pascalCase()}}Contract>(){{/needs_contract}}),
  );
  
  {{#use_bloc}}// Register blocs
  di.register<{{feature_name.pascalCase()}}Bloc>(
    {{feature_name.pascalCase()}}Bloc(di.get<Get{{feature_name.pascalCase()}}UseCase>()),
  );{{/use_bloc}}
}

// Add this line to your setupDependencies() function:
// setup{{feature_name.pascalCase()}}Dependencies(); 