class Profile {
  final String name;
  final String role;
  final String email;
  final String phoneNumber;
  final String imageUrl;

  Profile({
    required this.name,
    required this.role,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'],
      role: map['role'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      imageUrl: map['imageUrl'],
    );
  }

  Profile copyWith({
    String? name,
    String? role,
    String? email,
    String? phoneNumber,
    String? imageUrl,
  }) {
    return Profile(
      name: name ?? this.name,
      role: role ?? this.role,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

