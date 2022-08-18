$(function () {
  // Document is ready
  //   let pname = $("#Package_Name").val();
  //   console.log(pname);
  $("#Package").change(function (e) {
    console.log("test");
    console.log($(e.target).val());
    $("#PackageA").text($(e.target).val());
    $("#PackageB").text($(e.target).val());
  });

  //   $("#date-pick").change(function (e) {
  //     console.log($("#date-pick").val());
  //     $.session.set("date-pick", $("#date-pick").val());
  //   });
  $("#date-start").daterangepicker(
    {
      autoUpdateInput: true,
      singleDatePicker: true,
      autoApply: true,
      minDate: new Date(),
      showCustomRangeLabel: false,
      locale: {
        format: "MM-DD-YYYY",
      },
    },
    function (start) {
      console.log("save session1");
      sessionStorage.setItem("start-date", start.format("YYYY-MM-DD"));
    }
  );
  $("#date-end").daterangepicker(
    {
      autoUpdateInput: true,
      singleDatePicker: true,
      autoApply: true,
      minDate: new Date(),
      showCustomRangeLabel: false,
      locale: {
        format: "MM-DD-YYYY",
      },
    },
    function (start) {
      console.log("save session2");
      sessionStorage.setItem("end-date", start.format("YYYY-MM-DD"));
    }
  );
  $("#twzipcode").twzipcode({});
});

