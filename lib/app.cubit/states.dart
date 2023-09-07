abstract class AppStates {}

class InitialAppState extends AppStates {}

class GetDataFromDatabaseState extends AppStates {}

class InsertUserState extends AppStates {}

class IsUserFoundState extends AppStates {}

class CalculateMBIState extends AppStates {}

class ClearAllTextState extends AppStates {}

class SetGetSharedPref extends AppStates {}

class SetDataInInputsInProfile extends AppStates {}

class RandomRecipeState extends AppStates {}
class RandomSweetState extends AppStates {}
class FavoriteSweet extends AppStates {}
class DelFavoriteSweet extends AppStates {}
class FavoriteRecipe extends AppStates {}
class DelFavoriteRecipe extends AppStates {}
class ToggleFav extends AppStates {}

class GetPrevRecipeState extends AppStates {}
class GetPrevSweetState extends AppStates {}