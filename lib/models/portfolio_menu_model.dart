import 'dart:convert';

import 'package:flutter/material.dart';

class MenuItemsModel {
  MenuItemsModel({
    required this.iconDatum,
    required this.titleHeader,
  });

  IconData? iconDatum;
  String titleHeader;
}

PortfolioDatum portfolioDatumFromJson(String str) =>
    PortfolioDatum.fromJson(json.decode(str));

String portfolioDatumToJson(Map<String, dynamic> data) => json.encode(data);

class PortfolioDatum {
  String fullName;
  String profession;
  String shortDescription;
  String mobileNumber;
  String emailAddress;
  String location;
  String linkedinProfile;
  String link1;
  String link2;
  String link3;
  String summary;
  List<String> technicalSkills;
  List<Education> education;
  List<Experience> experience;
  List<RecentProject> recentProjects;

  PortfolioDatum({
    required this.fullName,
    required this.profession,
    required this.shortDescription,
    required this.mobileNumber,
    required this.emailAddress,
    required this.location,
    required this.linkedinProfile,
    required this.link1,
    required this.link2,
    required this.link3,
    required this.summary,
    required this.technicalSkills,
    required this.education,
    required this.experience,
    required this.recentProjects,
  });

  factory PortfolioDatum.fromJson(Map<String, dynamic> json) => PortfolioDatum(
        fullName: json["full_name"] ?? '',
        profession: json["profession"] ?? '',
        shortDescription: json["short_description"] ?? '',
        mobileNumber: json["mobile_number"] ?? '',
        emailAddress: json["email_address"] ?? '',
        location: json["location"] ?? '',
        linkedinProfile: json["linkedin_profile"] ?? '',
        link1: json["link1"] ?? '',
        link2: json["link2"] ?? '',
        link3: json["link3"] ?? '',
        summary: json["summary"] ?? '',
        technicalSkills:
            List<String>.from(json["technical_skills"].map((x) => x)),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        experience: List<Experience>.from(
            json["experience"].map((x) => Experience.fromJson(x))),
        recentProjects: List<RecentProject>.from(
            json["recent_projects"].map((x) => RecentProject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "profession": profession,
        "short_description": shortDescription,
        "mobile_number": mobileNumber,
        "email_address": emailAddress,
        "location": location,
        "linkedin_profile": linkedinProfile,
        "link1": link1,
        "link2": link2,
        "link3": link3,
        "summary": summary,
        "technical_skills": List<dynamic>.from(technicalSkills.map((x) => x)),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
        "recent_projects":
            List<dynamic>.from(recentProjects.map((x) => x.toJson())),
      };
}

class Education {
  String collegeName;
  String course;
  String degree;
  int startYear;
  int endYear;

  Education({
    required this.collegeName,
    required this.course,
    required this.degree,
    required this.startYear,
    required this.endYear,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        collegeName: json["college_name"] ?? '',
        course: json["course"] ?? '',
        degree: json["degree"] ?? '',
        startYear: json["start_year"] ?? 0,
        endYear: json["end_year"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "college_name": collegeName,
        "course": course,
        "degree": degree,
        "start_year": startYear,
        "end_year": endYear,
      };
}

class Experience {
  String companyName;
  String position;
  String startYear;
  String endYear;

  Experience({
    required this.companyName,
    required this.position,
    required this.startYear,
    required this.endYear,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        companyName: json["company_name"] ?? '',
        position: json["position"] ?? '',
        startYear: json["start_year"] ?? '',
        endYear: json["end_year"] ?? 'Present',
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "position": position,
        "start_year": startYear,
        "end_year": endYear == 'Present' ? '' : endYear,
      };
}

class RecentProject {
  String projectName;
  String bannerImage;
  String description;
  String projectLink1;
  String projectLink2;
  bool personalWork;

  RecentProject({
    required this.projectName,
    required this.bannerImage,
    required this.description,
    required this.projectLink1,
    required this.projectLink2,
    required this.personalWork,
  });

  factory RecentProject.fromJson(Map<String, dynamic> json) => RecentProject(
        projectName: json["project_name"] ?? '',
        bannerImage: json["banner_image"] ?? '',
        description: json["description"] ?? '',
        projectLink1: json["project_link1"] ?? '',
        projectLink2: json["project_link2"] ?? '',
        personalWork: json["personal_work"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "project_name": projectName,
        "banner_image": bannerImage,
        "description": description,
        "project_link1": projectLink1,
        "project_link2": projectLink2,
        "personal_work": personalWork,
      };
}
