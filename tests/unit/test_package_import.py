def test_package_import() -> None:
    import package_name

    assert package_name.__version__ == "0.1.0"
