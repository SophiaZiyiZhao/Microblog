defmodule Microblog.TofollowTest do
  use Microblog.DataCase

  alias Microblog.Tofollow

  describe "followers" do
    alias Microblog.Tofollow.Follow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tofollow.create_follow()

      follow
    end

    test "list_followers/0 returns all followers" do
      follow = follow_fixture()
      assert Tofollow.list_followers() == [follow]
    end

    test "get_follow!/1 returns the follow with given id" do
      follow = follow_fixture()
      assert Tofollow.get_follow!(follow.id) == follow
    end

    test "create_follow/1 with valid data creates a follow" do
      assert {:ok, %Follow{} = follow} = Tofollow.create_follow(@valid_attrs)
    end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tofollow.create_follow(@invalid_attrs)
    end

    test "update_follow/2 with valid data updates the follow" do
      follow = follow_fixture()
      assert {:ok, follow} = Tofollow.update_follow(follow, @update_attrs)
      assert %Follow{} = follow
    end

    test "update_follow/2 with invalid data returns error changeset" do
      follow = follow_fixture()
      assert {:error, %Ecto.Changeset{}} = Tofollow.update_follow(follow, @invalid_attrs)
      assert follow == Tofollow.get_follow!(follow.id)
    end

    test "delete_follow/1 deletes the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{}} = Tofollow.delete_follow(follow)
      assert_raise Ecto.NoResultsError, fn -> Tofollow.get_follow!(follow.id) end
    end

    test "change_follow/1 returns a follow changeset" do
      follow = follow_fixture()
      assert %Ecto.Changeset{} = Tofollow.change_follow(follow)
    end
  end
end
