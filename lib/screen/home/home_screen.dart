import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loka_apps/bloc/banner/bloc.dart';
import 'package:loka_apps/bloc/news/bloc.dart';
import 'package:loka_apps/bloc/profile/bloc.dart';
import 'package:loka_apps/function/shared_pref.dart';
import 'package:loka_apps/model/banner/banner_response_model.dart';
import 'package:loka_apps/model/news/news_model.dart';
import 'package:loka_apps/repo/banner/banner_repo.dart';
import 'package:loka_apps/repo/news/news_repo.dart';
import 'package:loka_apps/repo/profile/profile_repo.dart';
import 'package:loka_apps/screen/ajukan/ajukan_screen.dart';
import 'package:loka_apps/screen/news_detail/news_detail_screen.dart';
import 'package:loka_apps/util/credi_card_container.dart';
import 'package:loka_apps/util/custom_carousel.dart';
import 'package:loka_apps/util/custom_container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:loka_apps/util/custom_rounded.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List images = ['assets/imgs/foto1.png', 'assets/imgs/foto2.png'];
  int totalLoan = 0;
  bool isLoading = false;
  ProfileBloc profileBloc = ProfileBloc(profileRepository: ProfileRepository());
  BannerBloc bannerBloc = BannerBloc(bannerRepository: BannerRepository());
  NewsBloc newsBloc = NewsBloc(newsRepository: NewsRepository());

  @override
  void initState() {
    SharedPref().getSharedString('token').then((value) {
      if (value != null) {
        profileBloc.add(GetProfile(value));
      }
    });
    bannerBloc.add(GetBanner());
    newsBloc.add(GetNews());
    super.initState();
  }

  @override
  void dispose() {
    profileBloc.close();
    bannerBloc.close();
    newsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
        cubit: profileBloc,
        listener: (_, ProfileState state) {
          if (state is ProfileLoading) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is ProfileLoaded) {
            setState(() {
              isLoading = false;
              totalLoan = state.responseProfileModel.data.loan_limit;
            });
          }
          if (state is ProfileError) {
            setState(() {
              isLoading = false;
            });
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
            cubit: profileBloc,
            builder: (_, ProfileState state) {
              if (state is ProfileInitial) {
                return _mainContent();
              }
              if (state is ProfileLoading) {
                return _mainContent();
              }
              if (state is ProfileLoaded) {
                return _mainContent();
              }
              if (state is ProfileError) {
                return _mainContent();
              }
              return _mainContent();
            }));
  }

  Widget _mainContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0,
                    color: Colors.grey[300],
                    spreadRadius: 5.0),
              ],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(51),
                bottomLeft: Radius.circular(51),
              ),
              color: Colors.white,
            ),
            child: Hero(
              tag: "card",
              child: Material(
                color: Colors.transparent,
                child: !isLoading
                    ? CreditCardContainer(limit: totalLoan)
                    : Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.4),
                        highlightColor: Colors.white,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 24, right: 24, top: 8, bottom: 24),
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5.0,
                                  color: Colors.grey[200],
                                  offset: Offset(0, 5)),
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AjukanScreen()),
              );
            },
            child: Container(
              width: double.infinity,
              child: CustomContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'assets/imgs/money.png',
                      width: 35,
                    ),
                    Text(
                      'Ajukan Pinjaman',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          BlocListener<BannerBloc, BannerState>(
              cubit: bannerBloc,
              listener: (_, BannerState state) {},
              child: BlocBuilder<BannerBloc, BannerState>(
                  cubit: bannerBloc,
                  builder: (_, BannerState state) {
                    if (state is BannerInitial) {
                      return _loadingCarousel();
                    }
                    if (state is BannerLoading) {
                      return _loadingCarousel();
                    }
                    if (state is BannerLoaded) {
                      return _sliderCarousel(state.bannerResponseModel);
                    }
                    if (state is BannerError) {
                      return Container();
                    }
                    return Container();
                  })),
          SizedBox(height: 8),
          CustomContainer(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Riwayat Pembayaran",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CustomRoundedButton(
                      buttonText: "Lihat Semua",
                      color: Colors.blue,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: Text('Belum ada Riwayat Pembayaran'),
                )
                // ListView(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   children: <Widget>[
                //     HistoryListTile(
                //       iconColor: IconColors.transfer,
                //       onTap: () {},
                //       transactionAmount: "Rp. 200.000",
                //       transactionIcon: IconImgs.transfer,
                //       transactionName: "Pembayaran 1/12",
                //       transactionType: "PEMBAYARAN",
                //     ),
                //     HistoryListTile(
                //       iconColor: IconColors.transfer,
                //       onTap: () {},
                //       transactionAmount: "Rp. 200.000",
                //       transactionIcon: IconImgs.transfer,
                //       transactionName: "Pembayaran 2/12",
                //       transactionType: "PEMBAYARAN",
                //     ),
                //     HistoryListTile(
                //       iconColor: IconColors.transfer,
                //       onTap: () {},
                //       transactionAmount: "Rp. 200.000",
                //       transactionIcon: IconImgs.transfer,
                //       transactionName: "Pembayaran 3/12",
                //       transactionType: "PEMBAYARAN",
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 240,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Berita Terkini",
                      ),
                      Text(
                        "Lihat Semua",
                      ),
                    ],
                  ),
                ),
                BlocListener<NewsBloc, NewsState>(
                    cubit: newsBloc,
                    listener: (_, NewsState state) {},
                    child: BlocBuilder<NewsBloc, NewsState>(
                        cubit: newsBloc,
                        builder: (_, NewsState state) {
                          if (state is NewsInitial) {
                            return _loadingCarousel2();
                          }
                          if (state is NewsLoading) {
                            return _loadingCarousel2();
                          }
                          if (state is NewsLoaded) {
                            return _sliderCarouselNews(state.newsModel);
                          }
                          if (state is NewsError) {
                            return Container();
                          }
                          return Container();
                        })),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _sliderCarouselNews(NewsModel newsModel) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 2);
          },
          itemCount: newsModel.data.data.length,
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          NewsDetailScreen(data: newsModel.data.data[index])),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: 120,
                          color: Colors.blue,
                          child: Image.network(
                            newsModel.data.data[index].image,
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(height: 8),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: Text(newsModel.data.data[index].title))
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _loadingCarousel() {
    return Container(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.4),
        highlightColor: Colors.white,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 145,
        ),
      ),
    );
  }

  Widget _loadingCarousel2() {
    return Container(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.4),
        highlightColor: Colors.white,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 110,
        ),
      ),
    );
  }

  Widget _sliderCarousel(BannerResponseModel bannerResponseModel) {
    return Carousel(
      height: 174,
      items: bannerResponseModel.data,
      builderFunction: (context, item) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              color: Colors.blue,
              child: Image.network(
                item.image,
                fit: BoxFit.cover,
              )),
        );
      },
    );
  }
}
